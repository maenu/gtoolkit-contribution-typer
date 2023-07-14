Class {
	#name : #TypInfReceiverConstrainingMessageStrategy,
	#superclass : #TypInfLookupMessageStrategy,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfReceiverConstrainingMessageStrategy >> apply [
	| receiver classes |
	receiver := message receiver.
	classes := TypInfMethodIndex instance implementors: message selector.
	message state
		at: message inReceiver
		put: (classes collect: #typAsType) typAsType.
	super apply
]

{ #category : #accessing }
TypInfReceiverConstrainingMessageStrategy >> canApply [
	| receiver |
	super canApply ifFalse: [ ^ false ].
	receiver := message receiver.
	(receiver isUnknown
		or: [ receiver isVariable and: [ receiver super isUnknown ] ])
		ifFalse: [ ^ false ].
	^ (TypInfMethodIndex instance implementors: message selector) size
		between: 1
		and: 8
]
