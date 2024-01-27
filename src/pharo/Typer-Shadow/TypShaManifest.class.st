Class {
	#name : #TypShaManifest,
	#superclass : #PackageManifest,
	#traits : 'TypTManifest',
	#classTraits : 'TypTManifest classTrait',
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaManifest class >> build [
	TypShaIndex instance
]

{ #category : #accessing }
TypShaManifest class >> invalidate [
	TypShaIndex invalidate
]

{ #category : #accessing }
TypShaManifest class >> shortName [
	^ 'shadow'
]
