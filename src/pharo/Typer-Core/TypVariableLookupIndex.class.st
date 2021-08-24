Class {
	#name : #TypVariableLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypVariableLookupIndex class >> instance [

	^ instance ifNil: [ 
		  instance := self new
			              initializeResolver:
				              (TypCachingLookupResolver resolver:
						               (TypBreadthFirstLookupResolver resolvers: { 
									                (TypDepthFirstLookupResolver resolver:
											                 (TypBreadthFirstLookupResolver resolvers:
													                  { 
														                  TypPraVariableLookupResolver new.
														                  TypShaVariableLookupResolver new })).
									                (TypDepthFirstLookupResolver resolver:
											                 TypInfVariableLookupResolver new) }));
			              yourself ]
]

{ #category : #accessing }
TypVariableLookupIndex >> lookupReceiver: aType selector: aSymbol [

	| lookup |
	lookup := TypVariableLookup receiver: aType selector: aSymbol.
	(resolver canResolve: lookup) ifFalse: [ 
		^ TypUnknownType new copyWithOrigins:
			  { (TypLookupOrigin lookup: lookup) } ].
	^ resolver resolve: lookup
]
