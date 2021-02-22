Class {
	#name : #TypShaGtGtSourceCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtSourceCoder class >> shadowedClass [
	^ GtSourceCoder class
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mClassOrMetaClass: aLookup [
	<typShaMethod: 'classOrMetaClass'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mCollapsedEditor: aLookup [
	<typShaMethod: 'collapsedEditor'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BrTextEditor typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mExpanded: aLookup [
	<typShaMethod: 'expanded:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {Boolean typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mMethodsCoder: aLookup [ 
	<typShaMethod: 'methodsCoder:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | GtMethodsCoder typAsType ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mSource: aLookup [
	<typShaMethod: 'source'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: String typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
