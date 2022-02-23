Class {
	#name : #TypInfFlowLiteralArray,
	#superclass : #TypInfFlowNode,
	#traits : 'TTypInfFlowWithArguments',
	#classTraits : 'TTypInfFlowWithArguments classTrait',
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
TypInfFlowLiteralArray >> initialValueIn: aState [

	"can pull child literals as it is literal itself"

	^ node isForByteArray
		  ifTrue: [ ByteArray typAsType ]
		  ifFalse: [ 
			  Array typAsType withParameters:
				  { (self arguments collect: [ :e | e initialValueIn: aState ])
					  typAsType } ]
]
