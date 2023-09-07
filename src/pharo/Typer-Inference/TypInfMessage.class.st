Class {
	#name : #TypInfMessage,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#instVars : [
		'currentStrategy',
		'strategies',
		'lookup'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMessage >> arguments [
	^ self inArguments collect: [ :n | state at: n ]
]

{ #category : #accessing }
TypInfMessage >> constrainedReceiver [
	| receiver implementors |
	receiver := self receiver.
	receiver isUnknown
		ifFalse: [ ^ ({#ifNil:.
				#ifNotNil:.
				#ifNil:ifNotNil:.
				#ifNotNil:ifNil:} includes: self selector)
				ifTrue: [ receiver asNullable ]
				ifFalse: [ receiver ] ].
	implementors := TypInfMethodIndex instance implementors: self selector.
	(implementors size between: 1 and: 8) ifFalse: [ ^ receiver ].
	^ (implementors collect: #typAsType) typAsMinimizedType
]

{ #category : #accessing }
TypInfMessage >> findInReceiver [
	self depthFirstNextReverseDo: [ :n | n node == node receiver ifTrue: [ ^ n ] ].
	Error signal: 'no receiver found'
]

{ #category : #accessing }
TypInfMessage >> inReceiver [
	^ self inAt: #receiver ifAbsentPut: [ self findInReceiver ]
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
			TypInfNullMessageStrategy message: self}.
	currentStrategy := strategies last
]

{ #category : #accessing }
TypInfMessage >> lookup [
	^ lookup ifNil: [ lookup := self inReceiver newMethodLookup: self ]
]

{ #category : #accessing }
TypInfMessage >> receiver [
	^ state at: self inReceiver
]

{ #category : #accessing }
TypInfMessage >> selector [
	^ node selector
]

{ #category : #'as yet unclassified' }
TypInfMessage >> strategy [
	^ currentStrategy
]

{ #category : #accessing }
TypInfMessage >> transfer [
	| oldStrategy |
	lookup := nil.
	oldStrategy := currentStrategy.
	currentStrategy := strategies detect: #canInstall.
	currentStrategy == oldStrategy
		ifFalse: [ oldStrategy ifNotNil: #uninstall.
			currentStrategy install ].
	currentStrategy transfer.
	state at: self inReceiver put: self receiver asNonNullable
]

{ #category : #accessing }
TypInfMessage >> uninstall [
	currentStrategy uninstall.
	currentStrategy := nil
]
