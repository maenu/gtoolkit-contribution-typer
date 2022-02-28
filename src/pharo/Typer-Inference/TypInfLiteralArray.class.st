Class {
	#name : #TypInfLiteralArray,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLiteralArray >> initialize: aState [

	"can pull child literals as it is literal itself"

	^ aState at: self put: (node isForByteArray
			 ifTrue: [ ByteArray typAsType ]
			 ifFalse: [ 
				 Array typAsType withParameters:
					 { (self arguments collect: [ :e | e initialize: aState ])
						 typAsType } ])
]
