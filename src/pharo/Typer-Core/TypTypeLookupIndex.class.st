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
							(TypDepthLookupResolver new
								resolver:
									(TypBreadthLookupResolver new
										resolvers:
											{TypPraTypeLookupResolver new.
											TypShaTypeLookupResolver new.
											TypInfTypeLookupResolver new};
										yourself);
								yourself);
						yourself);
				yourself ]
]

{ #category : #accessing }
TypTypeLookupIndex >> lookupClassDescription: aClassDescription [
	^ self lookup: (TypTypeLookup classDescription: aClassDescription)
]
