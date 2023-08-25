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
	receiver := self constrainedReceiver.
	((receiver
		preResolveMethod: (TypMethodLookup
				receiver: receiver
				selector: message selector
				arguments: message arguments
				self: receiver
				super: receiver superOrNil
				parent: nil)) anySatisfy: [ :e | e resolver isKindOf: TypInfMethodResolver ])
		ifFalse: [ ^ false ].
	newContexts := self newContexts.
	(newContexts size between: 1 and: 8) ifFalse: [ ^ false ].
	^ newContexts allSatisfy: #canInstall
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
	| receiver selfType superType |
	receiver := self constrainedReceiver.
	selfType := message inReceiver selfIn: receiver.
	superType := message inReceiver superIn: receiver.
	^ (receiver
		preResolveMethod: (TypMethodLookup
				receiver: selfType
				selector: message selector
				arguments: message arguments
				self: selfType
				super: superType
				parent: nil))
		flatCollect: [ :l | 
			(l resolver isKindOf: TypInfMethodResolver)
				ifTrue: [ | method |
					method := l receiver classDescription lookupSelector: message selector.
					(method isAbstract
						ifTrue: [ selfType overriddingMethods: message selector ]
						ifFalse: [ (selfType overriddingMethods: message selector) , {method} ])
						flatCollect: [ :m | 
							(method methodClass typInfCanAbstractInterpret: message)
								ifTrue: [ method methodClass typInfAbstractInterpret: message ]
								ifFalse: [ {TypInfInlineContext
											sender: message context
											state: message state copy
											node: ([ m ast ]
													on: OCUndeclaredVariableWarning
													do: [ :ex | ex resume: ex declareUndefined ])
											self: l self
											super: l super
											message: message} ] ] ]
				ifFalse: [ {TypInfInlineLookupContext
							sender: message context
							state: message state copy
							node: message copy
							self: selfType
							super: superType
							message: message} ] ]
		as: Set
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> transfer [
	message constrain: message inReceiver to: self constrainedReceiver.
	self updateContexts.
	message state
		at: message
		put: (contexts flatCollect: [ :e | e root inReturns collect: #type ]) typAsType
]

{ #category : #accessing }
TypInfInlineMethodMessageStrategy >> uninstall [
	message
		inAt: #receiver
		ifPresent: [ :r | message unconstrain: r ]
		ifAbsent: [  "noop" ].	"might be in dirty state during node uninstall"
	contexts
		do: #uninstall;
		removeAll.
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
	oldContexts := contexts.
	contexts := self newContexts asOrderedCollection
			collect: [ :c | 
				oldContexts
					detect: [ :cc | cc = c ]
					ifFound: #yourself
					ifNone: c ].
	(oldContexts difference: contexts) do: #uninstall.
	(contexts difference: oldContexts) do: #install.
	(contexts anySatisfy: [ :e | e root isNil ]) ifTrue: [ Halt now ]
]
