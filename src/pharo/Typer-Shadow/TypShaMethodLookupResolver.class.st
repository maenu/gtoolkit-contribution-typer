Class {
	#name : #TypShaMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypMethodLookupResult>'>
	aLookup push: self.
	aLookup receiverType isNamed
		ifFalse: [ TypNoTypeError signal ].
	aLookup receiverType hasClassDescription
		ifFalse: [ TypNoTypeError signal ].
	^ (aLookup receiverType classDescription typShaShadows
		collect: [ :f | f asMethodLookupResultFor: aLookup selector ])
		reject: #isNil
]
