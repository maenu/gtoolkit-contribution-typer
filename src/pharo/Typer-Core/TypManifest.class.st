Class {
	#name : #TypManifest,
	#superclass : #PackageManifest,
	#category : #'Typer-Core-Core'
}

{ #category : #accessing }
TypManifest class >> allPackages [
	^ RPackageOrganizer default packages
		select: [ :e | e name beginsWith: 'Typer' ]
]

{ #category : #accessing }
TypManifest class >> buildAll [
	(self allPackages collect: #packageManifestOrNil)
		reject: #isNil
		thenDo: [ :c | (c class includesSelector: #build) ifTrue: [ c build ] ]
]

{ #category : #accessing }
TypManifest class >> flags [
	^ 'Typer' gtPackageMatches & #flag: gtSenders
]

{ #category : #accessing }
TypManifest class >> invalidate [
	TypEdgeKey invalidateAll.
	TypIndex invalidateAll.
	TypNode invalidateAll
]

{ #category : #accessing }
TypManifest class >> invalidateAll [
	(self allPackages collect: #packageManifestOrNil)
		reject: #isNil
		thenDo: [ :c | (c class includesSelector: #invalidate) ifTrue: [ c invalidate ] ]
]

{ #category : #accessing }
TypManifest class >> nilAll [
	(self allPackages collect: #packageManifestOrNil)
		reject: #isNil
		thenDo: [ :c | (c class includesSelector: #nil) ifTrue: [ c nil ] ]
]

{ #category : #accessing }
TypManifest class >> nuke [
	"nukes typer from memory.
	before calling you should close all tabs to get rid of references in coders etc.
	this takes minutes, but due to memory size checks should not take hours"

	<gtExample>
	| before after result beforeFinder afterFinder paths |
	self nilAll.
	before := self spaceTallyResultsItems.
	before typInfIsInvalidatedEverything
		ifTrue: [ ^ {before.
				'success, one garbage collection did it'} ].
	self invalidateAll.
	after := self spaceTallyResultsItems.
	after typInfIsInvalidatedEverything
		ifTrue: [ ^ {before.
				after.
				'success, two garbage collections did it'} ].
	result := {before.
		after.
		'failure, there are still too many instantiated typer classes'}.
	Smalltalk vm memorySize < (2 * 10 ** 9)
		ifFalse: [ ^ result
				, {'failure, more than 2GB and instantiated typer classes, #pointersTo and ReferenceFinder can help to find out who references it, but it is really slow for this memory size. try closing all tabs and run this again. save, close, start may also help, but saving GB images can be slow'} ].
	
	"somehow, calling ReferenceFinder and subsequent GC gets rid of more objects, sometimes"
	beforeFinder results
		detect: [ :e | (e analyzedClassName beginsWith: 'TypGt') not ]
		ifFound: [ :e | paths := ReferenceFinder findAllPathsToInstanceOf: e analyzedClassName asClass ]
		ifNone: [ ^ result
				, {beforeFinder.
						'failure, tried finding a paths to an instantiated typer class, but none found. try closing all tabs and run this again. save, close, start may also help, but saving GB images can be slow'} ].
	afterFinder := self spaceTallyResultsItems.
	afterFinder typInfIsInvalidatedEverything
		ifFalse: [ ^ result
				, {beforeFinder.
						afterFinder.
						'success, all gone after nudging garbage collection'} ].
	paths
		ifNotNil: [ ^ result
				, {beforeFinder.
						afterFinder.
						'failure, nudged garbage collection, break the found paths by nilling a reference in the right place, see next element for paths'.
						paths} ].
	^ result
		, {beforeFinder.
				afterFinder.
				'failure, multiple garbage collections and tricks did not reduce instantiated classes to four gt classes, but could not find a reference to an instance of one of the non-gt ones. is the reference finder not finding all references?'}
]

{ #category : #accessing }
TypManifest class >> recompileAll [
	(self allPackages flatCollect: #definedClasses) do: #recompile
]

{ #category : #accessing }
TypManifest class >> spaceTallyResultsItems [
	<gtExample>
	"system-wide seems to be faster than querying ~100 classes"
	^ (SpaceTally new systemWideSpaceTally 
		select: [ :e | e analyzedClassName beginsWith: 'Typ' ])
		sorted: [ :a :b | a instanceCount > b instanceCount ]
]

{ #category : #accessing }
TypManifest >> nil [
	"clean up undeclareds
	not sure how to reproduce
	the undeclared class instance variable was pointing to a value"
	
	SmalltalkImage cleanUp.
	Undeclared associations
		select: [ :a | a value class package name beginsWith: 'Typer' ]
		thenDo: [ :a | Undeclared removeKey: a key ]
]
