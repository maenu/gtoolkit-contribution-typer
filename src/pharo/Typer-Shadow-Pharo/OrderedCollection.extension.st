Extension { #name : #OrderedCollection }

{ #category : #'*Typer-Shadow-Pharo' }
OrderedCollection >> typShaMethodKeywordAddFirst: aLookup root: anotherLookup [
	<typShaMethod: 'addFirst:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedCollection >> typShaMethodKeywordAtPut: aLookup root: anotherLookup [
	<typShaMethod: 'at:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: #A)
		arguments: {Integer typAsType.
				aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedCollection >> typShaMethodUnaryRemoveLast: aLookup root: anotherLookup [
	<typShaMethod: 'removeLast'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
OrderedCollection class >> typShaType: aLookup root: anotherLookup [
	<typShaType>
	^ anotherLookup classDescription
		typAsParametricTypeWithParameters: {#A -> #A typAsVariableType}
]
