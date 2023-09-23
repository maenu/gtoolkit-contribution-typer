Class {
	#name : #TypInfInlMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference-Inline'
}

{ #category : #accessing }
TypInfInlMethodResolver >> canResolve: aLookup [
	aLookup root typInfMessage ifNil: [ ^ false ].
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ true
]

{ #category : #accessing }
TypInfInlMethodResolver >> result: aLookup [
	| message method methods contexts |
	message := aLookup root typInfMessage.
	method := aLookup receiver classDescription lookupSelector: aLookup selector.
	methods := aLookup root self overriders: aLookup selector.
	method isAbstract ifFalse: [ methods := methods , {method} ].
	contexts := methods
			collect: [ :m | 
				TypInfInlContext
					sender: message context
					state: message state copy
					node: ([ m ast ]
							on: OCUndeclaredVariableWarning
							do: [ :e | e resume: e declareUndefined ])
					self: aLookup self
					super: aLookup super
					message: message ].
	^ method typInfType typInfWithContexts: contexts
]
