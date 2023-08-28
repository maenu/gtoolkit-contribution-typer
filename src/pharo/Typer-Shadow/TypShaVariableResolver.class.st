Class {
	#name : #TypShaVariableResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaVariableResolver >> canResolve: aLookup [
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ (TypShaMethodIndex instance
		variableResolvers: aLookup receiver classDescription
		selector: aLookup selector) isNotEmpty
]

{ #category : #printing }
TypShaVariableResolver >> printOn: aStream [

	aStream nextPutAll: 'sha variable'
]

{ #category : #accessing }
TypShaVariableResolver >> resolve: aLookup [
	| class |
	self assert: [ self canResolve: aLookup ].
	aLookup initializeResolver: self.
	class := TypShaMethodIndex instance
			anonymousClass: aLookup receiver classDescription.
	^ self
		resolve: aLookup
		reduce: ((TypShaMethodIndex instance
				variableResolvers: aLookup receiver classDescription
				selector: aLookup selector)
				collect: [ :s | class typShaResolve: s lookup: aLookup ])
]
