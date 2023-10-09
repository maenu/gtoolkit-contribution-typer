Class {
	#name : #TypInfInlMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfInlMethodResolver >> canResolve: aLookup [
	| method |
	aLookup message context stackSize <= TypInfNodeStack maxSize
		ifFalse: [ ^ false ].
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	(aLookup receiver classDescription canUnderstand: aLookup selector)
		ifFalse: [ ^ false ].
	method := aLookup receiver classDescription lookupSelector: aLookup selector.
	method size > 100 ifTrue: [ ^ false ].	"exclude the largest 10%"
	((self methods: aLookup) size between: 1 and: 4) ifFalse: [ ^ false ].	"exclude the largest 5%"
	(aLookup message couldBeSelfOrSuperSend not
		and: [ aLookup message hasNodes not
				and: [ (aLookup message context stackSize <= (TypInfNodeStack maxSize / 2)) not ] ])
		ifTrue: [ ^ false ].
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
						ifTrue: [ TypInfInlContext
								sender: message context
								state: message state copy
								node: ([ a value ast ]
										on: OCUndeclaredVariableWarning
										do: [ :e | e resume: e declareUndefined ])
								self: aLookup root self
								super: aLookup root super
								message: message ]
						ifFalse: [ TypInfInlLookupContext
								sender: message context
								state: message state copy
								node: message node copy
								self: aLookup root self
								super: aLookup root super
								message: message
								lookup: a key ]) ]
]
