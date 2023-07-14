Class {
	#name : #TypInfInlineMethodMessageStrategy,
	#superclass : #TypInfMessageStrategy,
	#instVars : [
		'contexts'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> apply [
	| oldContexts |
	self assert: [ self canApply ].
	message
		outAt: #nextOriginal
		ifAbsent: [ message
				outAt: #next
				ifPresent: [ :target | 
					message outRemoveAt: #next.
					message outAt: #nextOriginal put: target ]
				ifAbsent: [ Error signal: 'node must have next edge' ] ].
	oldContexts := contexts.
	contexts := self newContexts asOrderedCollection.
	(oldContexts difference: contexts) do: #revert.
	(contexts difference: oldContexts) do: #apply
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> canApply [
	| receiver |
	receiver := message receiver.
	receiver isNamed ifFalse: [ ^ false ].
	receiver hasClassDescription ifFalse: [ ^ false ].
	(receiver classDescription canUnderstand: message selector)
		ifFalse: [ ^ false ].
	self newContexts size < 8 ifFalse: [ ^ false ].
	^ TypInfNodeStack canPush: message
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> initialize [
	super initialize.
	contexts := Set new
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> newContexts [
	| method |
	method := message receiver classDescription lookupSelector: message selector.
	^ (method isAbstract
		ifTrue: [ method typInfOverriddingMethods ]
		ifFalse: [ {method} ])
		collect: [ :m | 
			| selfType |
			selfType := m methodClass typAsType.
			TypInfInlineContext
				sender: message context
				state: message state copy
				node: m ast
				self: selfType
				super: selfType superOrNil
				message: message ]
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> revert [
	contexts
		do: #revert;
		removeAll.
	message
		outAdd: (TypInfNextEdge origin: message target: (message outAt: #nextOriginal))
]
