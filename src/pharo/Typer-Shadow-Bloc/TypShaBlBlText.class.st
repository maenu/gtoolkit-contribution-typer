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
		typAsFunctionTypeWithResult: '@self' typAsVariableType
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
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {BlTextAttribute typAsType}
				argumentsOptional: false
				signalsAlways: false)}
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
