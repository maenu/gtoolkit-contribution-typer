Class {
	#name : #TypShaBlBlText,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlText class >> shadowedClass [
	^ BlText class
]

{ #category : #shadow }
TypShaBlBlText >> mAttribute: aLookup [
	<typShaMethod: 'attribute:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlTextAttribute typAsType}
]

{ #category : #shadow }
TypShaBlBlText >> mAttributesAt: aLookup [
	<typShaMethod: 'attributesAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {BlTextAttribute typAsType})
		arguments: {Integer typAsType}
]

{ #category : #shadow }
TypShaBlBlText >> mClearAttributes: aLookup [

	<typShaMethod: 'clearAttributes:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: aLookup root receiver
		  arguments: { (BlockClosure
				   typAsFunctionTypeWithResult: TypUnknownType instance
				   arguments: { BlTextAttribute typAsType }) }
]

{ #category : #shadow }
TypShaBlBlText >> mFromTo: aLookup [
	<typShaMethod: 'from:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BlText typAsType
		arguments:
			{Integer typAsType.
			Integer typAsType}
]
