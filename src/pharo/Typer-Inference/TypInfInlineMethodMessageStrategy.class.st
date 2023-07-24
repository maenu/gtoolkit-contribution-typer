Class {
	#name : #TypInfInlineMethodMessageStrategy,
	#superclass : #TypInfLookupMessageStrategy,
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
		outAt: #next
		ifPresent: [ :n | 
			message
				outAt: #nextOriginal put: n;
				outRemoveAt: #next ]
		ifAbsent: [  "noop" ].
	oldContexts := contexts.
	contexts := self newContexts asOrderedCollection.
	(oldContexts difference: contexts) do: #revert.
	(contexts difference: oldContexts) do: #apply
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> canApply [
	| receiver newContexts |
	receiver := message receiver.
	receiver isNamed ifFalse: [ ^ false ].
	receiver hasClassDescription ifFalse: [ ^ false ].
	(receiver classDescription canUnderstand: message selector)
		ifFalse: [ ^ false ].
	newContexts := self newContexts.
	newContexts size < 8 ifFalse: [ ^ false ].
	^ newContexts allSatisfy: #canApply
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
		outAt: #nextOriginal
		ifPresent: [ :n | 
			message
				outAdd: (TypInfNextEdge origin: message target: n);
				outRemoveAt: #nextOriginal ]
		ifAbsent: [  "noop" ]
]
