Class {
	#name : #TypInfAbstractInterpretationMessageStrategy,
	#superclass : #TypInfInlineMethodMessageStrategy,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfAbstractInterpretationMessageStrategy >> canInstall [
	| receiver |
	receiver := message receiver.
	receiver isNamed ifFalse: [ ^ false ].
	receiver hasClassDescription ifFalse: [ ^ false ].
	^ receiver classDescription typInfCanAbstractInterpret: message
]

{ #category : #accessing }
TypInfAbstractInterpretationMessageStrategy >> newContexts [
	^ (message receiver classDescription typInfAbstractInterpret: message)
		collect: [ :e | 
			lookup resolver: TypInfAbstractInterpretationResolver instance.
			lookup -> e ]
]
