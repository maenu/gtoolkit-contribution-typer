Class {
	#name : #TypTypeLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypTypeLookupIndex class >> instance [

	^ instance ifNil: [ 
		  instance := self new
			              initializeResolver:
				              (TypCachingLookupResolver resolver:
						               (TypBreadthFirstLookupResolver resolvers: { 
									                (TypDepthFirstLookupResolver resolver:
											                 (TypBreadthFirstLookupResolver resolvers:
													                  { 
														                  TypPraTypeLookupResolver new.
														                  TypShaTypeLookupResolver new })).
									                (TypDepthFirstLookupResolver resolver:
											                 TypInfTypeLookupResolver new) }));
			              yourself ]
]

{ #category : #accessing }
TypTypeLookupIndex >> lookupClassDescription: aClassDescription [
	| lookup |
	lookup := TypTypeLookup classDescription: aClassDescription.
	(resolver canResolve: lookup)
		ifFalse: [ ^ TypUnknownType new
				addOrigin: (TypLookupOrigin lookup: lookup);
				yourself ].
	^ resolver resolve: lookup
]
