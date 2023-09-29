Class {
	#name : #TypManifest,
	#superclass : #PackageManifest,
	#category : #'Typer-Core-Core'
}

{ #category : #accessing }
TypManifest class >> allPackages [
	^ RPackageOrganizer default packages
		select: [ :e | e name beginsWith: 'Typer' ]
		thenCollect: #packageManifestOrNil
]

{ #category : #accessing }
TypManifest class >> invalidate [
	TypEdgeKey invalidateAll.
	TypIndex invalidateAll.
	TypNode invalidateAll
]

{ #category : #accessing }
TypManifest class >> invalidateEverything [
	self allPackages
		reject: #isNil
		thenDo: [ :c | (c class includesSelector: #invalidate) ifTrue: [ c invalidate ] ]
]
