Class {
	#name : #TypShaPhaRBPragmaNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaRBPragmaNode class >> mSelectorArguments: aLookup [ 
	<typShaMethod: 'selector:arguments:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Symbol typAsType ]
				ifFalse: [ SequenceableCollection typAsType
						copyWithParameters: {RBLiteralValueNode typAsType} ] ];
		resultType: [ :a :s :r | RBPragmaNode typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBPragmaNode class >> shadowedClass [
	^ RBPragmaNode class
]

{ #category : #shadow }
TypShaPhaRBPragmaNode >> mSelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Symbol typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
