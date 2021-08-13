Class {
	#name : #TypShaPhaClassDescription,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaClassDescription class >> shadowedClass [
	^ ClassDescription class
]

{ #category : #shadow }
TypShaPhaClassDescription >> mAddInstVarNamed: aLookup [
	<typShaMethod: 'addInstVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaClassDescription >> mClassSide: aLookup [
	<typShaMethod: 'classSide'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription classSide typAsType
]

{ #category : #shadow }
TypShaPhaClassDescription >> mHasInstVarNamed: aLookup [
	<typShaMethod: 'hasInstVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaClassDescription >> mInstanceSide: aLookup [
	<typShaMethod: 'instanceSide'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
]

{ #category : #shadow }
TypShaPhaClassDescription >> mIsClassSide: aLookup [
	<typShaMethod: 'isClassSide'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaClassDescription >> mIsTestCase: aLookup [
	<typShaMethod: 'isTestCase'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
