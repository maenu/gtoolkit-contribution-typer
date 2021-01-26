Class {
	#name : #TypShaVariableLookupResult,
	#superclass : #TypVariableLookupResult,
	#instVars : [
		'shadow',
		'name'
	],
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaVariableLookupResult class >> shadow: anObject name: aSymbol [
	^ self new
		initializeShadow: anObject name: aSymbol;
		yourself
]

{ #category : #accessing }
TypShaVariableLookupResult >> initializeShadow: anObject name: aSymbol [
	shadow := anObject.
	name := aSymbol
]

{ #category : #accessing }
TypShaVariableLookupResult >> type [
	^ shadow class instVarNames
		detect: [ :e | e = ('___' , name) ]
		ifFound: [ :e | shadow instVarNamed: e ]
		ifNone: [ Error
				signal:
					'No instance variable named #___' , name asString
						, ' found in shadow ' , shadow class name ]
]
