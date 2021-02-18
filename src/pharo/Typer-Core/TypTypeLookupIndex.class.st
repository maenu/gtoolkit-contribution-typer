Class {
	#name : #TypTypeLookupIndex,
	#superclass : #TypLookupIndex,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypTypeLookupIndex class >> instance [
	<typTypeResultAs: 'TypClassDescriptionLookupIndex'>
	^ instance
		ifNil: [ instance := self new
				resolver:
					(TypCachingLookupResolver new
						resolver:
							(TypBreadthLookupResolver new
								resolvers:
									{(TypDepthLookupResolver new
										resolver:
											(TypBreadthLookupResolver new
												resolvers:
													{TypPraTypeLookupResolver new.
													TypShaTypeLookupResolver new};
												yourself);
										yourself).
									(TypDepthLookupResolver new
										resolver: TypInfTypeLookupResolver new;
										yourself)};
								yourself);
						yourself);
				yourself ]
]

{ #category : #accessing }
TypTypeLookupIndex >> typeFor: aLookup [
	<typTypeArgument: 1 as: 'TypClassDescriptionLookup'>
	^ (resolver resolve: aLookup)
		detect: [ :e | 
			[ e type.
			true ]
				on: TypNoTypeError
				do: [ false ] ]
		ifFound: #type
		ifNone: [ TypUnknownType new ]
]
