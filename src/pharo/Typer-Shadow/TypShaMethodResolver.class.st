Class {
	#name : #TypShaMethodResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodResolver >> canResolve: aLookup [
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ (TypShaMethodIndex instance
		methodResolvers: aLookup receiver classDescription
		selector: aLookup selector) isNotEmpty
]

{ #category : #printing }
TypShaMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'sha method'
]

{ #category : #accessing }
TypShaMethodResolver >> result: aLookup [
	| class |
	class := TypShaMethodIndex instance
			anonymousClass: aLookup receiver classDescription.
	^ self
		resolve: aLookup
		reduce: ((TypShaMethodIndex instance
				methodResolvers: aLookup receiver classDescription
				selector: aLookup selector)
				collect: [ :s | class typShaResolve: s lookup: aLookup ])
]
