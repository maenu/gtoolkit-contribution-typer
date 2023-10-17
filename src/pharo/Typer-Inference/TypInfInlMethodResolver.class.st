Class {
	#name : #TypInfInlMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfInlMethodResolver >> canResolve: aLookup [
	| methods |
	aLookup message context stackSize < TypInfIndex instance maxNodeStackSize
		ifFalse: [ ^ false ].
	(aLookup message couldBeSelfOrSuperSend or: [ aLookup message hasNodes ])
		ifFalse: [ ^ false ].
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	(aLookup receiver classDescription canUnderstand: aLookup selector)
		ifFalse: [ ^ false ].
	methods := self methods: aLookup.
	self flag: 'Q inline some of it, lookup the rest, like for variables?'.
	(methods size between: 1 and: TypInfIndex instance maxImplementors)
		ifFalse: [ ^ false ].
	methods
		detect: [ :a | a value size > TypInfIndex instance maxMethodSize ]
		ifFound: [ ^ false ].
	^ true
]

{ #category : #accessing }
TypInfInlMethodResolver >> methods: aLookup [
	| method |
	method := aLookup receiver classDescription lookupSelector: aLookup selector.
	method isAbstract ifFalse: [ ^ {aLookup -> method} ].
	^ (aLookup root self overriders: aLookup selector)
		flatCollect: [ :m | self methods: (aLookup withReceiver: m methodClass typAsType) ]
		as: Set
]

{ #category : #accessing }
TypInfInlMethodResolver >> result: aLookup [
	| method message |
	method := aLookup receiver classDescription lookupSelector: aLookup selector.
	message := aLookup root message.
	^ (self methods: aLookup)
		collect: [ :a | 
			a key
				-> ((a key asDefault preResolved resolver isKindOf: TypInfMethodResolver)
						ifTrue: [ | node |
							node := [ a value ast ]
									on: OCUndeclaredVariableWarning
									do: [ :e | e resume: e declareUndefined ].
							message contexts
								detect: [ :aa | (aa value isKindOf: TypInfInlContext) and: aa value node == node ]
								ifFound: [ :aa | aa value adoptSelf: aLookup root self super: aLookup root super ]
								ifNone: [ TypInfInlContext
										sender: message context
										state: message state copy
										node: node
										self: aLookup root self
										super: aLookup root super
										message: message ] ]
						ifFalse: [ TypInfInlLookupContext
								sender: message context
								state: message state copy
								node: message node
								self: aLookup root self
								super: aLookup root super
								message: message
								lookup: a key ]) ]
]
