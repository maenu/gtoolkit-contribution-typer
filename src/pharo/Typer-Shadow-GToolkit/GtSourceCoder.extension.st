Extension { #name : #GtSourceCoder }

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodKeywordExpanded: aLookup root: anotherLookup [
	<typShaMethod: 'expanded:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodKeywordMethodsCoder: aLookup root: anotherLookup [
	<typShaMethod: 'methodsCoder:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {GtMethodsCoder typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodUnaryClassOrMetaClass: aLookup root: anotherLookup [
	<typShaMethod: 'classOrMetaClass'>
	^ CompiledMethod typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodUnaryCollapsedEditor: aLookup root: anotherLookup [
	<typShaMethod: 'collapsedEditor'>
	^ CompiledMethod typAsFunctionTypeWithResult: BrTextEditor typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtSourceCoder >> typShaMethodUnarySource: aLookup root: anotherLookup [
	<typShaMethod: 'source'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
