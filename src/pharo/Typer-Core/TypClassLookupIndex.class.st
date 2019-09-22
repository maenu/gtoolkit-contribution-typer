Class {
	#name : #TypClassLookupIndex,
	#superclass : #TypLookupIndex,
	#instVars : [
		'index'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypClassLookupIndex class >> newDefault [
	^ self new
		resolver:
			(TypCachingLookupResolver new
				resolver:
					(TypBreadthLookupResolver new
						resolvers:
							{(TypDepthLookupResolver new
								resolver:
									(TypBreadthLookupResolver new
										resolvers:
											{TypPraClassLookupResolver new.
											TypShaClassLookupResolver new};
										yourself);
								yourself).
							(TypDepthLookupResolver new
								resolver: TypInfClassLookupResolver new;
								yourself)};
						yourself);
				yourself);
		yourself
]

{ #category : #initialization }
TypClassLookupIndex >> initialize [
	super initialize.
	index := IdentityDictionary new
]

{ #category : #initialization }
TypClassLookupIndex >> reset [
	super reset.
	index removeAll
]

{ #category : #accessing }
TypClassLookupIndex >> typeFor: aLookup [
	^ index
		at: aLookup clazz name asSymbol
		ifAbsentPut: [ (resolver resolve: aLookup)
				detect: [ :e | 
					[ | type |
					type := e type.
					type isUnknown not ]
						on: Error
						do: [ :f | 
							f logCr.
							self flag: 'FIXME signal?'.
							false ] ]
				ifFound: #type
				ifNone: [ TypUnknownType instance ] ]
]
