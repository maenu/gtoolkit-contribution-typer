Class {
	#name : #TypShaPhaRBCascadeNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBCascadeNode class >> shadowedClass [
	^ RBCascadeNode class
]

{ #category : #shadow }
TypShaPhaRBCascadeNode >> mMessages: aLookup [
	<typShaMethod: 'messages'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBMessageNode typAsType})
]
