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
	| receiver newContexts |
	receiver := message receiver.
	receiver isNamed ifFalse: [ ^ false ].
	receiver hasClassDescription ifFalse: [ ^ false ].
	(receiver classDescription includesSelector: message selector)
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
	| oldContexts |
	self assert: [ self canInstall ].
	message
		outAt: #nextOriginal
		ifAbsent: [ message
				outAt: #next
				ifPresent: [ :target | 
					self assert: [ (message out at: #next) size = 1 ].
					message outRemoveAt: #next.
					message outAt: #nextOriginal put: target ]
				ifAbsent: [ Error signal: 'node must have next edge' ] ].
	oldContexts := contexts.
	contexts := self newContexts asOrderedCollection.
	(oldContexts difference: contexts) do: #uninstall.
	(contexts difference: oldContexts) do: #install
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
TypInfInlineMethodMessageStrategy >> transfer [
	message state
		at: message
		put: ((message out at: #next) flatCollect: [ :e | e target inReturns collect: #type ])
				typAsType
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> uninstall [
	contexts
		do: #uninstall;
		removeAll.
	message
		outAt: #nextOriginal
		ifPresent: [ :n | 
			self
				assert: [ message
						outAt: #next
						ifPresent: [ false ]
						ifAbsent: [ true ] ].
			message
				outAdd: (TypInfNextEdge origin: message target: n);
				outRemoveAt: #nextOriginal ]
		ifAbsent: [  "noop" ]
]
