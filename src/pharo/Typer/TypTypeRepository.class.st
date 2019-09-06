Class {
	#name : #TypTypeRepository,
	#superclass : #TypRepository,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypTypeRepository >> defaultResultFor: aLookup [
	^ TypLookupTypeResult new
		type: TypUnknownType instance;
		lookup: aLookup;
		yourself
]

{ #category : #accessing }
TypTypeRepository >> typeFor: aLookup using: aBlock [
	self
		resolve: aLookup
		using: [ :r :a | 
			| result |
			result := [ aBlock cull: r cull: a ]
				on: TypNoCompatibleTypeError
				do: [ TypLookupTypeResult new
						type: TypUnknownType instance;
						lookup: aLookup;
						resolvedBy: a;
						resolver: r;
						yourself ].
			result type isUnknown
				ifFalse: [ ^ result ] ].
	^ next
		ifNil: [ self defaultResultFor: aLookup ]
		ifNotNil: [ [ next typeFor: aLookup using: aBlock ]
				on: TypNoCompatibleTypeError
				do: [ self defaultResultFor: aLookup ] ]
]
