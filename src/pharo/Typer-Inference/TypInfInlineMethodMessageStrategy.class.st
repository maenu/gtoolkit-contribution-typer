Class {
	#name : #TypInfInlineMethodMessageStrategy,
	#superclass : #TypInfMessageStrategy,
	#instVars : [
		'contexts',
		'lookup'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> canInstall [
	| newContexts |
	({message constrainedReceiver} , message arguments anySatisfy: #typInfHasNode)
		ifFalse: [ ^ false ].
	(message constrainedReceiver typInfCanResolveMethod: message lookup)
		ifFalse: [ ^ false ].
	newContexts := self newContexts.
	(newContexts size between: 1 and: 8) ifFalse: [ ^ false ].
	^ newContexts allSatisfy: [ :e | e value canInstall ]
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> initialize [
	super initialize.
	contexts := Set new
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> install [
	self assert: [ self canInstall ].
	contexts
		ifEmpty: [ message out
				at: #next
					ifPresent: [ :s | 
						s copy
							do: [ :e | 
								message
									outRemove: e;
									outAdd: (TypInfEdge
											origin: e origin
											target: e target
											key: #nextOriginal) ] ];
				at: #return
					ifPresent: [ :s | 
						s copy
							do: [ :e | 
								message
									outRemove: e;
									outAdd: (TypInfEdge
											origin: e origin
											target: e target
											key: #returnOriginal) ] ] ].
	self updateContexts
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> newContexts [
	^ message lookup preResolve
		flatCollect: [ :l | 
			(message constrainedReceiver typInfCanResolveMethod: l)
				ifTrue: [ | method |
					method := l receiver classDescription lookupSelector: message selector.
					(l root self overriders: message selector)
						, (method isAbstract ifTrue: [ {} ] ifFalse: [ {method} ])
						collect: [ :m | 
							l
									-> ((method methodClass typInfCanAbstractInterpret: message)
											ifTrue: [ method methodClass typInfAbstractInterpret: message ]
											ifFalse: [ TypInfInlineContext
													sender: message context
													state: message state copy
													node: ([ m ast ]
															on: OCUndeclaredVariableWarning
															do: [ :e | e resume: e declareUndefined ])
													self: l self
													super: l super
													message: message ]) ] ]
				ifFalse: [ {l
							-> (TypInfInlineLookupContext
									sender: message context
									state: message state copy
									node: message copy
									self: l root self
									super: l root super
									message: message)} ] ]
		as: Set
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> transfer [
	message constrain: message inReceiver to: message constrainedReceiver.
	self updateContexts.
	message state
		at: message
		put: (contexts flatCollect: [ :e | e value root inReturns collect: #type ]) typAsMinimizedType
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> uninstall [
	message
		inAt: #receiver
		ifPresent: [ :r | message unconstrain: r ]
		ifAbsent: [  "noop" ].	"might be in dirty state during node uninstall"
	contexts
		collect: #value thenDo: #uninstall;
		removeAll.
	lookup := nil.
	message out
		at: #nextOriginal
			ifPresent: [ :s | 
				s copy
					do: [ :e | 
						message
							outRemove: e;
							outAdd: (TypInfNextEdge origin: e origin target: e target) ] ]
			ifAbsent: [  "noop" ];
		at: #returnOriginal
			ifPresent: [ :s | 
				s copy
					do: [ :e | 
						message
							outRemove: e;
							outAdd: (TypInfReturnEdge origin: e origin target: e target) ] ]
			ifAbsent: [  "noop" ]
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> updateContexts [
	| oldContexts |
	lookup = message lookup ifTrue: [ ^ self ].
	lookup := message lookup.
	oldContexts := contexts.
	contexts := self newContexts asOrderedCollection
			collect: [ :c | 
				oldContexts
					detect: [ :cc | cc = c ]
					ifFound: [ :cc | cc ]
					ifNone: [ c ] ].
	(oldContexts difference: contexts) collect: #value thenDo: #uninstall.
	(contexts difference: oldContexts) collect: #value thenDo: #install
]
