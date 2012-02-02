/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2011 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiKeychainaccessModule.h"

@implementation TiKeychainaccessModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"f312643f-ed83-453a-b889-c914acdcb1f4";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.keychainaccess";
}

#pragma mark Lifecycle

-(void)startup
{
	[super startup];
	
	map = [[NSDictionary alloc] initWithObjectsAndKeys:
           kSecValueData,@"password",
           kSecAttrAccount,@"account",
           kSecAttrAccount,@"username",
           kSecAttrAccessible,@"accessible",
           kSecAttrAccessGroup,@"accessGroup",
           kSecAttrCreationDate,@"creationDate",
           kSecAttrModificationDate,@"modificationDate",
           kSecAttrDescription,@"description",
           kSecAttrComment,@"comment",
           kSecAttrCreator,@"creator",
           kSecAttrType,@"type",
           kSecAttrLabel,@"label",
           kSecAttrIsInvisible,@"isInvisible",
           kSecAttrIsNegative,@"isNegative",
           kSecAttrService,@"service",
           kSecAttrGeneric,@"generic",
           kSecAttrSecurityDomain,@"securityDomain",
           kSecAttrServer,@"server",
           kSecAttrProtocol,@"protocol",
           kSecAttrAuthenticationType,@"authenticationType",
           kSecAttrPort,@"port",
           kSecAttrPath,@"path",
           kSecAttrSubject,@"subject",
           kSecAttrIssuer,@"issuer",
           kSecAttrSerialNumber,@"serialNumber",
           kSecAttrSubjectKeyID,@"subjectKeyID",
           kSecAttrPublicKeyHash,@"publicKeyHash",
           kSecAttrCertificateType,@"certificateType",
           kSecAttrCertificateEncoding,@"certificateEncoding",
           kSecAttrKeyClass,@"keyClass",
           kSecAttrApplicationLabel,@"applicationLabel",
           kSecAttrIsPermanent,@"isPermanent",
           kSecAttrApplicationTag,@"applicationTag",
           kSecAttrKeyType,@"keyType",
           kSecAttrKeySizeInBits,@"keySizeInBits",
           kSecAttrEffectiveKeySize,@"effectiveKeySize",
           kSecAttrCanEncrypt,@"canEncrypt",
           kSecAttrCanDecrypt,@"canDecrypt",
           kSecAttrCanDerive,@"canDerive",
           kSecAttrCanSign,@"canSign",
           kSecAttrCanVerify,@"canVerify",
           kSecAttrCanWrap,@"canWrap",
           kSecAttrCanUnwrap,@"canUnwrap",
           nil];
}

-(void)dealloc
{
    [map release];
	[super dealloc];
}

#pragma mark Utility

-(id)convertKeyToConstant:(NSString*)key
{
    return [map objectForKey:key];
}

-(NSDictionary*)convertWrapperToDictionary:(KeychainItemWrapper*)wrapper
{
    NSMutableDictionary* retVal = [[NSMutableDictionary alloc] init];
    for (NSString* key in map) {
        id val = [wrapper objectForKey:[map objectForKey:key]];
        if (val != nil) {
            [retVal setValue:val forKey:key];
        }
    }
    return [retVal autorelease];
}

#pragma mark Public API

-(void)store:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString* identifier;
    ENSURE_ARG_FOR_KEY(identifier, args, @"id", NSString);
    NSString* accessGroup = nil;
    ENSURE_ARG_OR_NIL_FOR_KEY(accessGroup, args, @"accessGroup", NSString);
    
    KeychainItemWrapper* wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:identifier accessGroup:accessGroup];
    
    // Loop through our arguments, saving them in the Keychain.
    for (id strKey in args) {
        
        // Skip the identifier.
        if ([strKey isEqualToString:@"id"])
            continue;
        
        // Convert the string key in the dictionary to the proper attribute constant.
        id key = [self convertKeyToConstant:strKey];
        if (key == nil) {
            NSLog(@"[ERROR] %@ is not a supported attribute!", strKey);
            continue;
        }
        
        // Save it to the Keychain.
        [wrapper setObject:[args objectForKey:strKey] forKey:key];
        
    }
    
    [wrapper release];
}

-(id)retrieve:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString* identifier;
    ENSURE_ARG_FOR_KEY(identifier, args, @"id", NSString);
    NSString* accessGroup = nil;
    ENSURE_ARG_OR_NIL_FOR_KEY(accessGroup, args, @"accessGroup", NSString);
    
    KeychainItemWrapper* wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:identifier accessGroup:accessGroup];
    
    NSDictionary* converted = [self convertWrapperToDictionary:wrapper];
    
    [wrapper release];
    
    return converted;
}

@end
