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
TypManifest class >> invalidate [
	TypEdgeKey invalidateAll.
	TypIndex invalidateAll.
	TypNode invalidateAll
]

{ #category : #accessing }
TypManifest class >> invalidateEverything [
	(self allPackages collect: #packageManifestOrNil)
		reject: #isNil
		thenDo: [ :c | (c class includesSelector: #invalidate) ifTrue: [ c invalidate ] ]
]

{ #category : #accessing }
TypManifest class >> recompileAll [
	(self allPackages flatCollect: #definedClasses) do: #recompile
]
