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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlTextAttribute typAsType}
]

{ #category : #shadow }
TypShaBlBlText >> mAttributesAt: aLookup [
	<typShaMethod: 'attributesAt:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {BlTextAttribute typAsType})
		arguments: {Integer typAsType}
]

{ #category : #shadow }
TypShaBlBlText >> mClearAttributes: aLookup [
	<typShaMethod: 'clearAttributes:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {BlTextAttribute typAsType})}
]

{ #category : #shadow }
TypShaBlBlText >> mFromTo: aLookup [
	<typShaMethod: 'from:to:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BlText typAsType
		arguments:
			{Integer typAsType.
			Integer typAsType}
]
