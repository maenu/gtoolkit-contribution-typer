Class {
	#name : #TypShaPhaOCLiteralVariable,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaOCLiteralVariable class >> shadowedClass [
	^ OCLiteralVariable class
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mAssoc: aLookup [
	<typShaMethod: 'assoc'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Association typAsType
				copyWithParameters:
					{String typAsType.
					TypUnknownType new})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mIsClassVariable: aLookup [
	<typShaMethod: 'isClassVariable'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mIsFromSharedPool: aLookup [
	<typShaMethod: 'isFromSharedPool'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mIsGlobalClassNameBinding: aLookup [
	<typShaMethod: 'isGlobalClassNameBinding'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mIsGlobalVariable: aLookup [
	<typShaMethod: 'isGlobalVariable'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mScope: aLookup [
	<typShaMethod: 'scope'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: OCAbstractScope typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mValue: aLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Object typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
