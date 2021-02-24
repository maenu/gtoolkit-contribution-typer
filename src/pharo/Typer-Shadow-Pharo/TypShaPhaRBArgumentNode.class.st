Class {
	#name : #TypShaPhaRBArgumentNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBArgumentNode class >> shadowedClass [
	^ RBArgumentNode class
]

{ #category : #shadow }
TypShaPhaRBArgumentNode >> mWhoDefines: aLookup [
	<typShaMethod: 'whoDefines:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{RBMethodNode typAsType.
			RBBlockNode typAsType} typAsType asNullable
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]
