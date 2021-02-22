Class {
	#name : #TypShaPhaRBMessageNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBMessageNode class >> shadowedClass [
	^ RBMessageNode class
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mArguments: aLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(OrderedCollection typAsType
				copyWithParameters: {RBValueNode typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mKeywordsIntervals: aLookup [
	<typShaMethod: 'keywordsIntervals'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {(Interval typAsType copyWithParameters: {Integer typAsType})})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mNumArgs: aLookup [
	<typShaMethod: 'numArgs'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mReceiver: aLookup [
	<typShaMethod: 'receiver'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBValueNode typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mSelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Symbol typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
