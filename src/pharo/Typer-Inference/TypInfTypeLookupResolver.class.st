Class {
	#name : #TypInfTypeLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfTypeLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	aLookup push: self.
	^ {aLookup classDescription typAsType}
]
