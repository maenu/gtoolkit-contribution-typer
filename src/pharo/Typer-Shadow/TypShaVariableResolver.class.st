Class {
	#name : #TypShaVariableResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaVariableResolver >> canResolve: aLookup [
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ (TypShaIndex instance
		variableResolvers: aLookup receiver classDescription
		selector: aLookup selector) isNotEmpty
]

{ #category : #printing }
TypShaVariableResolver >> printOn: aStream [

	aStream nextPutAll: 'sha variable'
]

{ #category : #accessing }
TypShaVariableResolver >> result: aLookup [
	^ self
		resolve: aLookup
		reduce: ((TypShaIndex instance
				variableResolvers: aLookup receiver classDescription
				selector: aLookup selector)
				collect: [ :m | nil withArgs: {aLookup} executeMethod: m ])
]
