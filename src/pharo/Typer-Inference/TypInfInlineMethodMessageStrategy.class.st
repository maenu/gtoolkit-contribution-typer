Class {
	#name : #TypInfInlineMethodMessageStrategy,
	#superclass : #TypInfMessageStrategy,
	#instVars : [
		'contexts'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> canInstall [
	| receiver lookup newContexts |
	receiver := message receiver.
	(receiver canLookupMethod: message selector) ifFalse: [ ^ false ].
	lookup := TypMethodLookup
			receiver: message receiver
			selector: message selector
			arguments: message arguments
			super: nil.
	((receiver resolvedMethodLookups: lookup)
		anySatisfy: [ :e | e resolver isKindOf: TypInfMethodResolver ])
		ifFalse: [ ^ false ].
	newContexts := self newContexts.
	newContexts size < 8 ifFalse: [ ^ false ].
	^ newContexts allSatisfy: #canInstall
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> initialize [
	super initialize.
	contexts := Set new
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> install [
	| nextOriginal oldContexts |
	self assert: [ self canInstall ].
	contexts
		ifEmpty: [ nextOriginal := message outAt: #next.
			message outRemoveAt: #next.
			message outAt: #nextOriginal put: nextOriginal ]
		ifNotEmpty: [ nextOriginal := message outAt: #nextOriginal ].
	oldContexts := contexts.
	contexts := self newContexts asOrderedCollection.
	(oldContexts difference: contexts) do: #uninstall.
	(contexts difference: oldContexts) do: #install
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> newContexts [
	^ (message receiver
		resolvedMethodLookups: (TypMethodLookup
				receiver: message receiver
				selector: message selector
				arguments: message arguments
				super: nil))
		flatCollect: [ :l | 
			| selfType method |
			selfType := message receiver.
			(l resolver isKindOf: TypInfMethodResolver)
				ifTrue: [ method := l receiver classDescription lookupSelector: message selector.
					(method isAbstract
						ifTrue: [ method typInfOverriddingMethods ]
						ifFalse: [ {method} ])
						collect: [ :m | 
							TypInfInlineContext
								sender: message context
								state: message state copy
								node: m ast
								self: selfType
								super: selfType superOrNil
								message: message ] ]
				ifFalse: [ {TypInfInlineLookupContext
							sender: message context
							state: message state copy
							node: message copy
							self: selfType
							super: selfType superOrNil
							message: message} ] ]
		as: Set
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> transfer [
	message state
		at: message
		put: ((message out at: #next) flatCollect: [ :e | e target inReturns collect: #type ])
				typAsType
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> uninstall [
	| nextOriginal |
	contexts
		do: #uninstall;
		removeAll.
	nextOriginal := message outAt: #nextOriginal.
	message outRemoveAt: #nextOriginal.
	message outAdd: (TypInfNextEdge origin: message target: nextOriginal)
]
