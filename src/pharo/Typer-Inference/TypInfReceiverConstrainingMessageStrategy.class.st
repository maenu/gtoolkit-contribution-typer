Class {
	#name : #TypInfReceiverConstrainingMessageStrategy,
	#superclass : #TypInfMessageStrategy,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfReceiverConstrainingMessageStrategy >> canInstall [
	| receiver |
	receiver := message receiver.
	(receiver isUnknown
		or: [ receiver isVariable and: [ receiver super isUnknown ] ])
		ifFalse: [ ^ false ].
	^ (TypInfMethodIndex instance implementors: message selector) size
		between: 1
		and: 8
]

{ #category : #accessing }
TypInfReceiverConstrainingMessageStrategy >> transfer [
	| receiver classes |
	receiver := message receiver.
	classes := TypInfMethodIndex instance implementors: message selector.
	message state
		at: message inReceiver
		put: (classes collect: #typAsType) typAsType
]
