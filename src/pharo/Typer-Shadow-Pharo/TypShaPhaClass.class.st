Class {
	#name : #TypShaPhaClass,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaClass class >> shadowedClass [
	^ Class class
]

{ #category : #shadow }
TypShaPhaClass >> mAddClassVarNamed: aLookup [ 
	<typShaMethod: 'addClassVarNamed:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaClass >> mClassVarNamed: aLookup [ 
	<typShaMethod: 'classVarNamed:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaPhaClass >> mHasClassVarNamed: aLookup [ 
	<typShaMethod: 'hasClassVarNamed:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaClass >> mSharedPools: aLookup [ 
	<typShaMethod: 'sharedPools'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType copyWithParameters: {Class typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaClass >> mSubclassInstanceVariableNamesClassVariableNamesPackage: aLookup [ 
	<typShaMethod: 'subclass:instanceVariableNames:classVariableNames:package:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | a receiverType classDescription typAsType ];
		yourself
]
