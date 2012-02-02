var KeychainAccess = require('ti.keychainaccess');

var win = Ti.UI.createWindow({
    backgroundColor:'#fff',
    layout:'vertical'
});

var username = Ti.UI.createTextField({
    hintText:'Username',
    top:10, left:10, right:10,
    height:40,
    borderStyle:Ti.UI.INPUT_BORDERSTYLE_ROUNDED
});
win.add(username);

var password = Ti.UI.createTextField({
    hintText:'Password',
    top:2, left:10, right:10,
    height:40,
    borderStyle:Ti.UI.INPUT_BORDERSTYLE_ROUNDED,
    passwordMask:true
});
win.add(password);

var saveCredentials = Ti.UI.createButton({
    title:'Save Changes',
    top:10, left:10, right:10, bottom:10,
    height:40
});
win.add(saveCredentials);

var revertToSaved = Ti.UI.createButton({
    title:'Revert to Saved',
    top:2, left:10, right:10, bottom:10,
    height:40
});
win.add(revertToSaved);

var fields = [ username, password ];

function submitForm() {
    for (var i = 0; i < fields.length; i++) {
        if (!fields[i].value.length) {
            fields[i].focus();
            return;
        }
        fields[i].blur();
    }
    KeychainAccess.store({
        id:'credentials',
        username:username.value,
        password:password.value
    });
    alert('Saved!');
}

saveCredentials.addEventListener('click', submitForm);
for (var i = 0; i < fields.length; i++) {
    fields[i].addEventListener('return', submitForm);
}

function populateFields() {
    var retrieved = KeychainAccess.retrieve({
        id:'credentials'
    });
    Ti.API.info(retrieved);
    if (retrieved) {
        username.value = retrieved.username;
        password.value = retrieved.password;
        Ti.API.info('Credentials restored from Keychain!');
    }
    else {
        Ti.API.info('No credentials stored in Keychain!');
    }
}

revertToSaved.addEventListener('click', populateFields);

win.addEventListener('open', function () {
    populateFields();
    username.focus();
});

win.open();