Class {
	#name : #TypClassLookupIndex,
	#superclass : #TypLookupIndex,
	#instVars : [
		'index'
	],
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypClassLookupIndex >> initialize [
	super initialize.
	index := IdentityDictionary new
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
