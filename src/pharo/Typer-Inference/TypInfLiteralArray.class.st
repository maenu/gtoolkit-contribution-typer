Class {
	#name : #TypInfLiteralArray,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLiteralArray >> initialize: aState [

	"can pull child literals as it is literal itself"

	state := aState.
	^ state at: self put: (node isForByteArray
			   ifTrue: [ ByteArray typAsType ]
			   ifFalse: [ 
				   Array typAsType withParameters:
					   { (self incomingArguments collect: [ :e | e initialize: state ])
						   typAsType } ])
]
