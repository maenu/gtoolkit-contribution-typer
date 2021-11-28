Class {
	#name : #TypTypeIndex,
	#superclass : #TypIndex,
	#category : 'Typer-Core-Lookup'
}

{ #category : #accessing }
TypTypeIndex class >> instance [

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
TypTypeIndex >> lookupClassDescription: aClassDescription [

	| lookup |
	lookup := self
		          addDependent:
		          (TypTypeLookup classDescription: aClassDescription)
		          label: #lookup.
	(resolver canResolve: lookup) ifFalse: [ 
		^ lookup addDependent: TypUnknownType new label: #default ].
	^ resolver resolve: lookup
]
