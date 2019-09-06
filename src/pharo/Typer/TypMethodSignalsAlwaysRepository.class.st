Class {
	#name : #TypMethodSignalsAlwaysRepository,
	#superclass : #TypRepository,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodSignalsAlwaysRepository >> defaultResultFor: aLookup [
	^ TypLookupSignalsAlwaysResult new
		lookup: aLookup;
		yourself
]

{ #category : #initialization }
TypMethodSignalsAlwaysRepository >> initialize [
	<typTypeVariable: 'resolvers' as: 'SequenceableCollection<TypResolver<TypMethodLookup>>'>
	<typTypeVariable: 'next' as: 'TypMethodResolver<TypMethodLookup>'>
	super initialize
]

{ #category : #accessing }
TypMethodSignalsAlwaysRepository >> signalsAlways: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypLookupSignalsAlwaysResult'>
	self
		resolve: aLookup
		using: [ :r :a | 
			| result |
			result := [ r signalsAlwaysFor: aLookup resolvedBy: a ]
				on: TypNoCompatibleTypeError
				do: [ TypLookupSignalsAlwaysResult new
						lookup: aLookup;
						resolvedBy: a;
						resolver: r;
						yourself ].
			result signalsAlways ifNotNil: [ ^ result ] ].
	^ next
		ifNil: [ self defaultResultFor: aLookup ]
		ifNotNil: [ [ next signalsAlways: aLookup ]
				on: TypNoCompatibleTypeError
				do: [ self defaultResultFor: aLookup ] ]
]
