# Ti.KeychainAccess Module

## Description

Lets you store credentials securely in the iOS Keychain.

## Getting Started

View the [Using Titanium Modules](https://wiki.appcelerator.org/display/tis/Using+Titanium+Modules) document for instructions on getting
started with using this module in your application.

## Accessing the Ti.KeychainAccess Module

To access this module from JavaScript, you would do the following:

	var KeychainAccess = require('ti.keychainaccess');


## Simulator Usage

The Simulator's keychain does not support access groups. You can safely specify an access group. But if you need to test
cross app sharing through the Keychain, you must test on a device. This is per Apple's specifications.


## Methods

### void store(dictionary args)

Stores the specified dictionary in the iOS Keychain. If no store exists with the id you specify, it will be created.

Requires the following key:

* string id: The identifier for your keychain.

If you want to share access to the keychain across apps, also specify this key:

* string accessGroup: The access group for your keychain.

Past those two keys, you can specify any of the following keys:

* string username (or account)
* string password
* string accessible
* string creationDate
* string modificationDate
* string description
* string comment
* string creator
* string type
* string label
* string isInvisible
* string isNegative
* string service
* string generic
* string securityDomain
* string server
* string protocol
* string authenticationType
* string port
* string path
* string subject
* string issuer
* string serialNumber
* string subjectKeyID
* string publicKeyHash
* string certificateType
* string certificateEncoding
* string keyClass
* string applicationLabel
* string isPermanent
* string applicationTag
* string keyType
* string keySizeInBits
* string effectiveKeySize
* string canEncrypt
* string canDecrypt
* string canDerive
* string canSign
* string canVerify
* string canWrap
* string canUnwrap

### dictionary retrieve(dictionary args)

Retrieves a dictionary of values from the iOS Keychain. If no store exists with the id you specify, it will be created with default values.

Requires the following key:

* string id: The identifier for your keychain.

If you want to share access to the keychain across apps, also specify this key:

* string accessGroup: The access group for your keychain.

Returns a dictionary with any of the following keys:

* string username
* string account
* string password
* string accessible
* string creationDate
* string modificationDate
* string description
* string comment
* string creator
* string type
* string label
* string isInvisible
* string isNegative
* string service
* string generic
* string securityDomain
* string server
* string protocol
* string authenticationType
* string port
* string path
* string subject
* string issuer
* string serialNumber
* string subjectKeyID
* string publicKeyHash
* string certificateType
* string certificateEncoding
* string keyClass
* string applicationLabel
* string isPermanent
* string applicationTag
* string keyType
* string keySizeInBits
* string effectiveKeySize
* string canEncrypt
* string canDecrypt
* string canDerive
* string canSign
* string canVerify
* string canWrap
* string canUnwrap


## Usage
See example.


## Author
Dawson Toth

## Module History

View the [change log](changelog.html) for this module.

## Feedback and Support

Please direct all questions, feedback, and concerns to [info@appcelerator.com](mailto:info@appcelerator.com?subject=iOS%20KeychainAccess%20Module).

## License
Copyright(c) 2010-2011 by Appcelerator, Inc. All Rights Reserved. Please see the LICENSE file included in the distribution for further details.