Class {
	#name : #TypInfInlMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfInlMethodResolver >> canResolve: aLookup [
	| method |
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	(aLookup receiver classDescription canUnderstand: aLookup selector)
		ifFalse: [ ^ false ].
	method := aLookup receiver classDescription lookupSelector: aLookup selector.
	method size > 100 ifTrue: [ ^ false ].	"exclude the largest 10%"
	method isRealPrimitive ifTrue: [ ^ false ].
	method isAbstract
		ifTrue: [ ((aLookup root self overriders: aLookup selector) size between: 1 and: 4)
				ifFalse: [ ^ false ] ].
	(aLookup message couldBeSelfOrSuperSend not
		and: [ aLookup message hasNodes not
				and: [ (aLookup message context stackSize <= (TypInfNodeStack maxSize / 2)) not ] ])
		ifTrue: [ ^ false ].
	aLookup message context stackSize <= TypInfNodeStack maxSize
		ifFalse: [ ^ false ].
	^ true
]

{ #category : #accessing }
TypInfInlMethodResolver >> result: aLookup [
	| message method |
	message := aLookup root message.
	method := aLookup receiver classDescription lookupSelector: aLookup selector.
	^ (method isAbstract
		ifTrue: [ aLookup root self overriders: aLookup selector ]
		ifFalse: [ {method} ])
		collect: [ :m | 
			aLookup
				-> (TypInfInlContext
						sender: message context
						state: message state copy
						node: ([ m ast ]
								on: OCUndeclaredVariableWarning
								do: [ :e | e resume: e declareUndefined ])
						self: aLookup root self
						super: aLookup root super
						message: message) ]
]
