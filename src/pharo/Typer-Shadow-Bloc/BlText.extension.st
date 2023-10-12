Extension { #name : #BlText }

{ #category : #'*Typer-Shadow-Bloc' }
BlText >> typShaMethodKeywordAttribute: aLookup [
	<typShaMethod: 'attribute:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlTextAttribute typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlText >> typShaMethodKeywordAttributesAt: aLookup [
	<typShaMethod: 'attributesAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {BlTextAttribute typAsType})
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlText >> typShaMethodKeywordClearAttributes: aLookup [
	<typShaMethod: 'clearAttributes:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {BlTextAttribute typAsType}}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlText >> typShaMethodKeywordFromTo: aLookup [
	<typShaMethod: 'from:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BlText typAsType
		arguments: {Integer typAsType.
				Integer typAsType}
]
