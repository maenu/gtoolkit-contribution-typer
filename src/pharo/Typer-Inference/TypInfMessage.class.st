Class {
	#name : #TypInfMessage,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#instVars : [
		'currentStrategy',
		'strategies'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMessage >> arguments [
	^ self inArguments collect: [ :n | state at: n ]
]

{ #category : #accessing }
TypInfMessage >> inReceiver [

	^ self inAt: #receiver
]

{ #category : #accessing }
TypInfMessage >> inReceiver: aNode [

	^ self inAt: #receiver put: aNode
]

{ #category : #accessing }
TypInfMessage >> initialize [
	super initialize.
	strategies := {TypInfAbstractInterpretationMessageStrategy message: self.
			TypInfInlineMethodMessageStrategy message: self.
			TypInfLookupMessageStrategy message: self.
			TypInfReceiverConstrainingMessageStrategy message: self.
			TypInfNullMessageStrategy message: self}
]

{ #category : #accessing }
TypInfMessage >> receiver [
	^ state at: self inReceiver
]

{ #category : #accessing }
TypInfMessage >> selector [
	^ node selector
]

{ #category : #accessing }
TypInfMessage >> transfer [
	| oldStrategy |
	oldStrategy := currentStrategy.
	currentStrategy := strategies detect: #canInstall.
	currentStrategy == oldStrategy
		ifFalse: [ oldStrategy ifNotNil: #uninstall.
			currentStrategy install ].
	currentStrategy transfer
]
