Class {
	#name : #TypShaPhaRBSequenceNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBSequenceNode class >> shadowedClass [
	^ RBSequenceNode class
]

{ #category : #shadow }
TypShaPhaRBSequenceNode >> mStatements: aLookup [ 
	<typShaMethod: 'statements'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType
				copyWithParameters: {RBProgramNode typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBSequenceNode >> mTemporaries: aLookup [ 
	<typShaMethod: 'temporaries'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {RBTemporaryNode typAsType} ];
		yourself
]
