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
				              (TypCachingResolver resolver:
						               (TypBreadthFirstResolver resolvers: { 
									                (TypDepthFirstResolver resolver:
											                 (TypBreadthFirstResolver resolvers:
													                  { 
														                  TypPraTypeResolver new.
														                  TypShaTypeResolver new })).
									                (TypDepthFirstResolver resolver:
											                 TypInfTypeResolver new) }));
			              yourself ]
]

{ #category : #accessing }
TypTypeLookupIndex >> lookupClassDescription: aClassDescription [

	| lookup |
	lookup := self
		          addDependent:
		          (TypTypeLookup classDescription: aClassDescription)
		          path: #lookup.
	(resolver canResolve: lookup) ifFalse: [ 
		^ lookup addDependent: TypUnknownType new path: #default ].
	^ resolver resolve: lookup
]
