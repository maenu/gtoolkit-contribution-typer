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
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaClassDescription >> mClassSide: aLookup [
	<typShaMethod: 'classSide'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Metaclass typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaClassDescription >> mHasInstVarNamed: aLookup [
	<typShaMethod: 'hasInstVarNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaClassDescription >> mInstanceSide: aLookup [
	<typShaMethod: 'instanceSide'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Class typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaClassDescription >> mIsClassSide: aLookup [
	<typShaMethod: 'isClassSide'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaClassDescription >> mIsTestCase: aLookup [
	<typShaMethod: 'isTestCase'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
